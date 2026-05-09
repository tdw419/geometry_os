; DESCRIPTION: Renders a magenta box of size 31x91 starting at (372, 98).
; PLAN: r0=372(x), r1=98(y), r2=31(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 98
LDI r2, 31
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
