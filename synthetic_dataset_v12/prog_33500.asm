; DESCRIPTION: Renders a cyan line between points (446, 23) and (492, 57).
; PLAN: r0=446(x1), r1=23(y1), r2=492(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 23
LDI r2, 492
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
