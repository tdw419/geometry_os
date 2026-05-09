; DESCRIPTION: Composite: Places a white circle of radius 68 at center (365, 82) then Renders a red line between points (346, 67) and (437, 249).
; PLAN: r0=365(x), r1=82(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x1), r6=67(y1), r7=437(x2), r8=249(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 365
LDI r1, 82
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 67
LDI r7, 437
LDI r8, 249
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
