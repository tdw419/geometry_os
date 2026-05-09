; DESCRIPTION: Composite: Renders a magenta box of size 113x61 starting at (230, 111) then Renders a white line between points (20, 60) and (252, 83).
; PLAN: r0=230(x), r1=111(y), r2=113(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=20(x1), r6=60(y1), r7=252(x2), r8=83(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 230
LDI r1, 111
LDI r2, 113
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 60
LDI r7, 252
LDI r8, 83
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
