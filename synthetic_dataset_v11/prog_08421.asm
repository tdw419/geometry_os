; DESCRIPTION: Composite: . Then Creates a white rectangular region at (86, 215) spanning 92 by 24 pixels. Then Draws a white line from (159, 206) to (210, 105).
; PLAN: r0=86(x), r1=215(y), r2=92(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=159(x1), r1=206(y1), r2=210(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a white rectangular region at (86, 215) spanning 92 by 24 pixels.
; PLAN: r0=86(x), r1=215(y), r2=92(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 215
LDI r2, 92
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white line from (159, 206) to (210, 105).
; PLAN: r0=159(x1), r1=206(y1), r2=210(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 206
LDI r2, 210
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
