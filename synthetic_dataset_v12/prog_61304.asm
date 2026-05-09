; DESCRIPTION: Draws a cyan line from (446, 98) to (441, 174).
; PLAN: r0=446(x1), r1=98(y1), r2=441(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 98
LDI r2, 441
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
