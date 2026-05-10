; DESCRIPTION: Composite: Places a purple 76x81 rectangle at position (287, 93) then Places a purple line segment connecting (82, 239) to (387, 253).
; PLAN: r0=287(x), r1=93(y), r2=76(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=82(x1), r6=239(y1), r7=387(x2), r8=253(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 93
LDI r2, 76
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 239
LDI r7, 387
LDI r8, 253
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
