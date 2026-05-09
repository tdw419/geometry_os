; DESCRIPTION: Places a cyan 58x56 rectangle at position (340, 48).
; PLAN: r0=340(x), r1=48(y), r2=58(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 48
LDI r2, 58
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
