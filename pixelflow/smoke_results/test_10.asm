; DESCRIPTION: Fills the screen with a vertical gradient from black to white.
; PLAN: r0=0xFFFF00(color). CMPonly), r0.
LDI r0, 0x0000
FILL r0
HALT