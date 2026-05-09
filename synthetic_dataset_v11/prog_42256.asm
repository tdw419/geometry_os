; DESCRIPTION: Composite: . Then Places a cyan circle of radius 36 at center (176, 168). Then Places a green 54x27 rectangle at position (160, 24).
; PLAN: r0=176(x), r1=168(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=160(x), r1=24(y), r2=54(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 36 at center (176, 168).
; PLAN: r0=176(x), r1=168(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 168
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green 54x27 rectangle at position (160, 24).
; PLAN: r0=160(x), r1=24(y), r2=54(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 24
LDI r2, 54
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
