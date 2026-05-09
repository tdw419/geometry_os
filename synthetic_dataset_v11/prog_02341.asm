; DESCRIPTION: Composite: . Then Creates a red rectangular region at (148, 83) spanning 42 by 70 pixels. Then Renders a cyan line between points (15, 142) and (242, 120).
; PLAN: r0=148(x), r1=83(y), r2=42(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=15(x1), r1=142(y1), r2=242(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red rectangular region at (148, 83) spanning 42 by 70 pixels.
; PLAN: r0=148(x), r1=83(y), r2=42(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 83
LDI r2, 42
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan line between points (15, 142) and (242, 120).
; PLAN: r0=15(x1), r1=142(y1), r2=242(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 142
LDI r2, 242
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
