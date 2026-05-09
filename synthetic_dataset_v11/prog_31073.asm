; DESCRIPTION: Composite: . Then Places a green circle of radius 71 at center (170, 111). Then Places a cyan 22x21 rectangle at position (143, 138).
; PLAN: r0=170(x), r1=111(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=143(x), r1=138(y), r2=22(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green circle of radius 71 at center (170, 111).
; PLAN: r0=170(x), r1=111(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 111
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan 22x21 rectangle at position (143, 138).
; PLAN: r0=143(x), r1=138(y), r2=22(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 138
LDI r2, 22
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
