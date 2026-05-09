; DESCRIPTION: Renders a cyan box of size 90x90 starting at (197, 94).
; PLAN: r0=197(x), r1=94(y), r2=90(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 94
LDI r2, 90
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
