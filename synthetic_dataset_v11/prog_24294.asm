; DESCRIPTION: Composite: . Then Renders a black line between points (108, 97) and (192, 146). Then Places a cyan dot at position (128, 243).
; PLAN: r0=108(x1), r1=97(y1), r2=192(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=128(x), r1=243(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black line between points (108, 97) and (192, 146).
; PLAN: r0=108(x1), r1=97(y1), r2=192(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 97
LDI r2, 192
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (128, 243).
; PLAN: r0=128(x), r1=243(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 128
LDI r1, 243
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
