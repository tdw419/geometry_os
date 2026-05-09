; DESCRIPTION: Composite: . Then Places a white 20x26 rectangle at position (138, 29). Then Places a cyan line segment connecting (87, 100) to (95, 168).
; PLAN: r0=138(x), r1=29(y), r2=20(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=87(x1), r1=100(y1), r2=95(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white 20x26 rectangle at position (138, 29).
; PLAN: r0=138(x), r1=29(y), r2=20(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 29
LDI r2, 20
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan line segment connecting (87, 100) to (95, 168).
; PLAN: r0=87(x1), r1=100(y1), r2=95(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 100
LDI r2, 95
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
