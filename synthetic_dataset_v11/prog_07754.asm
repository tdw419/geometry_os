; DESCRIPTION: Composite: . Then Renders a red line between points (27, 244) and (224, 36). Then Renders a cyan box of size 38x69 starting at (144, 143).
; PLAN: r0=27(x1), r1=244(y1), r2=224(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=144(x), r1=143(y), r2=38(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red line between points (27, 244) and (224, 36).
; PLAN: r0=27(x1), r1=244(y1), r2=224(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 244
LDI r2, 224
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan box of size 38x69 starting at (144, 143).
; PLAN: r0=144(x), r1=143(y), r2=38(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 143
LDI r2, 38
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
