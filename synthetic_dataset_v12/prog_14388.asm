; DESCRIPTION: Composite: Places a blue dot at position (442, 180) then Renders a red line between points (199, 228) and (80, 176).
; PLAN: r0=442(x), r1=180(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=199(x1), r6=228(y1), r7=80(x2), r8=176(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 442
LDI r1, 180
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 199
LDI r6, 228
LDI r7, 80
LDI r8, 176
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
