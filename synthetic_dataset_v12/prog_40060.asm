; DESCRIPTION: Composite: Renders a black line between points (403, 28) and (433, 36) then Places a green dot at position (310, 37).
; PLAN: r0=403(x1), r1=28(y1), r2=433(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=310(x), r6=37(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 403
LDI r1, 28
LDI r2, 433
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 37
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
