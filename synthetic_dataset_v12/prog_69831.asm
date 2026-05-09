; DESCRIPTION: Renders a orange box of size 12x31 starting at (277, 160).
; PLAN: r0=277(x), r1=160(y), r2=12(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 160
LDI r2, 12
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
