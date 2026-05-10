; DESCRIPTION: Places a cyan 52x105 rectangle at position (284, 39).
; PLAN: r0=284(x), r1=39(y), r2=52(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 39
LDI r2, 52
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
