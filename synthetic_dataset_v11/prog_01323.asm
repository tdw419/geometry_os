; DESCRIPTION: Places a cyan 25x39 rectangle at position (20, 150).
; PLAN: r0=20(x), r1=150(y), r2=25(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 150
LDI r2, 25
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
