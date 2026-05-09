; DESCRIPTION: Places a red 118x70 rectangle at position (146, 40).
; PLAN: r0=146(x), r1=40(y), r2=118(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 40
LDI r2, 118
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
