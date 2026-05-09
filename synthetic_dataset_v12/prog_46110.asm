; DESCRIPTION: Renders a cyan line between points (446, 213) and (218, 41).
; PLAN: r0=446(x1), r1=213(y1), r2=218(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 213
LDI r2, 218
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
