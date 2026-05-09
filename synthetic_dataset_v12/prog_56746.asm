; DESCRIPTION: Renders a cyan box of size 32x53 starting at (209, 178).
; PLAN: r0=209(x), r1=178(y), r2=32(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 178
LDI r2, 32
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
