; DESCRIPTION: Composite: . Then Places a red 12x35 rectangle at position (117, 92). Then Places a yellow circle of radius 57 at center (176, 146).
; PLAN: r0=117(x), r1=92(y), r2=12(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=176(x), r1=146(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red 12x35 rectangle at position (117, 92).
; PLAN: r0=117(x), r1=92(y), r2=12(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 92
LDI r2, 12
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 57 at center (176, 146).
; PLAN: r0=176(x), r1=146(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 146
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
