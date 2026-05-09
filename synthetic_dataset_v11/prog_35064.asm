; DESCRIPTION: Composite: . Then Renders a red box of size 57x80 starting at (43, 34). Then Renders a cyan line between points (230, 146) and (238, 124).
; PLAN: r0=43(x), r1=34(y), r2=57(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=230(x1), r1=146(y1), r2=238(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red box of size 57x80 starting at (43, 34).
; PLAN: r0=43(x), r1=34(y), r2=57(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 34
LDI r2, 57
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan line between points (230, 146) and (238, 124).
; PLAN: r0=230(x1), r1=146(y1), r2=238(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 146
LDI r2, 238
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
