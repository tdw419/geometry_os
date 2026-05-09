; DESCRIPTION: Composite: . Then Places a yellow circle of radius 30 at center (180, 92). Then Places a cyan 59x106 rectangle at position (61, 125).
; PLAN: r0=180(x), r1=92(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=61(x), r1=125(y), r2=59(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow circle of radius 30 at center (180, 92).
; PLAN: r0=180(x), r1=92(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 92
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan 59x106 rectangle at position (61, 125).
; PLAN: r0=61(x), r1=125(y), r2=59(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 125
LDI r2, 59
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
