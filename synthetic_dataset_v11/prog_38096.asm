; DESCRIPTION: Composite: . Then Renders a green box of size 42x83 starting at (108, 5). Then Places a cyan line segment connecting (170, 161) to (82, 81).
; PLAN: r0=108(x), r1=5(y), r2=42(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=170(x1), r1=161(y1), r2=82(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green box of size 42x83 starting at (108, 5).
; PLAN: r0=108(x), r1=5(y), r2=42(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 5
LDI r2, 42
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan line segment connecting (170, 161) to (82, 81).
; PLAN: r0=170(x1), r1=161(y1), r2=82(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 161
LDI r2, 82
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
