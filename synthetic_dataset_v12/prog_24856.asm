; DESCRIPTION: Renders a green box of size 51x18 starting at (352, 221).
; PLAN: r0=352(x), r1=221(y), r2=51(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 221
LDI r2, 51
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
