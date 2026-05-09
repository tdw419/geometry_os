; DESCRIPTION: Places a cyan 20x33 rectangle at position (340, 120).
; PLAN: r0=340(x), r1=120(y), r2=20(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 120
LDI r2, 20
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
