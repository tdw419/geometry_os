; DESCRIPTION: Creates a orange rectangular region at (368, 8) spanning 27 by 48 pixels.
; PLAN: r0=368(x), r1=8(y), r2=27(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 8
LDI r2, 27
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
