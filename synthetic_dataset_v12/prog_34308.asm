; DESCRIPTION: Renders a cyan box of size 33x32 starting at (344, 32).
; PLAN: r0=344(x), r1=32(y), r2=33(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 32
LDI r2, 33
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
