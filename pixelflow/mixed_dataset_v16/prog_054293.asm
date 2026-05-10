; DESCRIPTION: Composite: Places a black 82x10 rectangle at position (208, 12) then Renders a cyan line between points (64, 116) and (477, 124).
; PLAN: r0=208(x), r1=12(y), r2=82(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=64(x1), r6=116(y1), r7=477(x2), r8=124(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 208
LDI r1, 12
LDI r2, 82
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 116
LDI r7, 477
LDI r8, 124
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
