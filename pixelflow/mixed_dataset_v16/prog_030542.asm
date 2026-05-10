; DESCRIPTION: Creates a orange rectangular region at (307, 168) spanning 60 by 65 pixels.
; PLAN: r0=307(x), r1=168(y), r2=60(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 168
LDI r2, 60
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
