; DESCRIPTION: Composite: . Then Places a cyan circle of radius 40 at center (156, 168). Then Places a red 42x29 rectangle at position (197, 221).
; PLAN: r0=156(x), r1=168(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=197(x), r1=221(y), r2=42(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 40 at center (156, 168).
; PLAN: r0=156(x), r1=168(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 168
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red 42x29 rectangle at position (197, 221).
; PLAN: r0=197(x), r1=221(y), r2=42(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 221
LDI r2, 42
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
