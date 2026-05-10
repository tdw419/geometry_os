; DESCRIPTION: Places 4 purple circles at the corners of the screen.
; PLAN: r0=0xAA00FF(color). Op: FILL r0.
LDI r0, 0xAA00FF
FILL r0
HALT
