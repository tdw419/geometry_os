; DESCRIPTION: Places a yellow 77x111 box at position (395, 27).
; PLAN: r0=395(x), r1=27(y), r2=77(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 27
LDI r2, 77
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
