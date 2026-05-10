; DESCRIPTION: Places a orange 33x65 box at position (294, 22).
; PLAN: r0=294(x), r1=22(y), r2=33(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 22
LDI r2, 33
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
