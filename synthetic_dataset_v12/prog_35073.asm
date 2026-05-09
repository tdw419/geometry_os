; DESCRIPTION: Renders a cyan line between points (243, 195) and (180, 71).
; PLAN: r0=243(x1), r1=195(y1), r2=180(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 195
LDI r2, 180
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
