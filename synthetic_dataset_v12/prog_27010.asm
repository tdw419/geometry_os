; DESCRIPTION: Renders a cyan line between points (295, 187) and (216, 228).
; PLAN: r0=295(x1), r1=187(y1), r2=216(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 187
LDI r2, 216
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
