; DESCRIPTION: Composite: . Then Draws a white rectangle at (161, 30) with width 87 and height 90. Then Draws a cyan line from (245, 189) to (146, 139).
; PLAN: r0=161(x), r1=30(y), r2=87(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=245(x1), r1=189(y1), r2=146(x2), r3=139(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white rectangle at (161, 30) with width 87 and height 90.
; PLAN: r0=161(x), r1=30(y), r2=87(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 30
LDI r2, 87
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan line from (245, 189) to (146, 139).
; PLAN: r0=245(x1), r1=189(y1), r2=146(x2), r3=139(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 189
LDI r2, 146
LDI r3, 139
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
