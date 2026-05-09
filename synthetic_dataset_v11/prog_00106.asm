; DESCRIPTION: Composite: . Then Places a cyan 46x50 rectangle at position (115, 171). Then Draws a green circle centered at (180, 48) with radius 38.
; PLAN: r0=115(x), r1=171(y), r2=46(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=180(x), r1=48(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan 46x50 rectangle at position (115, 171).
; PLAN: r0=115(x), r1=171(y), r2=46(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 171
LDI r2, 46
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (180, 48) with radius 38.
; PLAN: r0=180(x), r1=48(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 48
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
