; DESCRIPTION: Renders a magenta box of size 31x27 starting at (277, 9).
; PLAN: r0=277(x), r1=9(y), r2=31(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 9
LDI r2, 31
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
