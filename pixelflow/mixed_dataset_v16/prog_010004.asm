; DESCRIPTION: Renders a cyan line segment connecting (197, 46) to (57, 27).
; PLAN: r0=197(x1), r1=46(y1), r2=57(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 46
LDI r2, 57
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
