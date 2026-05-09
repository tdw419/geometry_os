; DESCRIPTION: Composite: . Then Places a cyan dot at position (239, 198). Then Renders a cyan disk with center (206, 135) and radius 38.
; PLAN: r0=239(x), r1=198(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=206(x), r1=135(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan dot at position (239, 198).
; PLAN: r0=239(x), r1=198(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 239
LDI r1, 198
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan disk with center (206, 135) and radius 38.
; PLAN: r0=206(x), r1=135(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 135
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
