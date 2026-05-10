; DESCRIPTION: Composite: Places a white 14x48 rectangle at position (458, 11) then Renders a white line between points (400, 51) and (32, 215).
; PLAN: r0=458(x), r1=11(y), r2=14(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x1), r6=51(y1), r7=32(x2), r8=215(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 458
LDI r1, 11
LDI r2, 14
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 51
LDI r7, 32
LDI r8, 215
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
