; DESCRIPTION: Composite: . Then Renders a black line between points (81, 98) and (193, 46). Then Places a magenta 55x45 rectangle at position (152, 38).
; PLAN: r0=81(x1), r1=98(y1), r2=193(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=152(x), r1=38(y), r2=55(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black line between points (81, 98) and (193, 46).
; PLAN: r0=81(x1), r1=98(y1), r2=193(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 98
LDI r2, 193
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta 55x45 rectangle at position (152, 38).
; PLAN: r0=152(x), r1=38(y), r2=55(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 38
LDI r2, 55
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
