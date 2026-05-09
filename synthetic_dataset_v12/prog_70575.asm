; DESCRIPTION: Places a green 40x38 rectangle at position (460, 5).
; PLAN: r0=460(x), r1=5(y), r2=40(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 5
LDI r2, 40
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
