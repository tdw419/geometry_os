; DESCRIPTION: Places a cyan 46x111 rectangle at position (279, 18).
; PLAN: r0=279(x), r1=18(y), r2=46(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 18
LDI r2, 46
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
