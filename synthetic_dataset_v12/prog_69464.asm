; DESCRIPTION: Places a cyan circle of radius 40 at center (392, 150).
; PLAN: r0=392(x), r1=150(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 150
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
