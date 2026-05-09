; DESCRIPTION: Composite: . Then Draws a red circle centered at (83, 184) with radius 42. Then Renders a yellow box of size 109x40 starting at (79, 154).
; PLAN: r0=83(x), r1=184(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=79(x), r1=154(y), r2=109(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red circle centered at (83, 184) with radius 42.
; PLAN: r0=83(x), r1=184(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 184
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a yellow box of size 109x40 starting at (79, 154).
; PLAN: r0=79(x), r1=154(y), r2=109(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 154
LDI r2, 109
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
