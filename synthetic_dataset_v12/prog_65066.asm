; DESCRIPTION: Composite: Renders a cyan box of size 73x120 starting at (340, 98) then Places a purple line segment connecting (413, 215) to (470, 42).
; PLAN: r0=340(x), r1=98(y), r2=73(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=413(x1), r6=215(y1), r7=470(x2), r8=42(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 340
LDI r1, 98
LDI r2, 73
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 215
LDI r7, 470
LDI r8, 42
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
