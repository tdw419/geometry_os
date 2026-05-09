; DESCRIPTION: Places a cyan 111x78 rectangle at position (346, 39).
; PLAN: r0=346(x), r1=39(y), r2=111(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 39
LDI r2, 111
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
