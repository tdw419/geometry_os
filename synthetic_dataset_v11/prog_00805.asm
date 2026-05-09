; DESCRIPTION: Composite: . Then Draws a black line from (116, 121) to (143, 81). Then Renders a red box of size 49x115 starting at (70, 33).
; PLAN: r0=116(x1), r1=121(y1), r2=143(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=70(x), r1=33(y), r2=49(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (116, 121) to (143, 81).
; PLAN: r0=116(x1), r1=121(y1), r2=143(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 121
LDI r2, 143
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red box of size 49x115 starting at (70, 33).
; PLAN: r0=70(x), r1=33(y), r2=49(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 33
LDI r2, 49
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
