; DESCRIPTION: Creates a orange rectangular region at (281, 168) spanning 117 by 16 pixels.
; PLAN: r0=281(x), r1=168(y), r2=117(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 168
LDI r2, 117
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
