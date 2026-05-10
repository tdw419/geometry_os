; DESCRIPTION: Renders a cyan line between points (412, 27) and (243, 248).
; PLAN: r0=412(x1), r1=27(y1), r2=243(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 27
LDI r2, 243
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
