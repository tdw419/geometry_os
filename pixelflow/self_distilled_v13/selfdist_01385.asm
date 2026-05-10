; DESCRIPTION: Renders a cyan rectangular region spanning 111 by 80 at (363, 84).
; PLAN: r0=363(x), r1=84(y), r2=111(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 84
LDI r2, 111
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
