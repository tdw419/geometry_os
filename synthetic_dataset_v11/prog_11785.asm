; DESCRIPTION: Composite: . Then Renders a purple box of size 82x33 starting at (165, 213). Then Creates a purple circular shape at (197, 163) with radius 14.
; PLAN: r0=165(x), r1=213(y), r2=82(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=197(x), r1=163(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple box of size 82x33 starting at (165, 213).
; PLAN: r0=165(x), r1=213(y), r2=82(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 213
LDI r2, 82
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (197, 163) with radius 14.
; PLAN: r0=197(x), r1=163(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 163
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
